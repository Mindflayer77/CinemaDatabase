from rest_framework import serializers
from .models import Film, Seans, Sala, Jezyk, WersjaJezykowa


class FilmSerializer(serializers.ModelSerializer):
    class Meta:
        model = Film
        fields = "__all__"


class SalaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sala
        fields = "__all__"


class JezykSerializer(serializers.ModelSerializer):
    class Meta:
        model = Jezyk
        fields = "__all__"


class WersjaJezykowaSerializer(serializers.ModelSerializer):
    jezyk = JezykSerializer()

    class Meta:
        model = WersjaJezykowa
        fields = ["wersja_id", "typ", "jezyk", "opis"]


class SeansSerializer(serializers.ModelSerializer):
    film = FilmSerializer()
    sala = SalaSerializer(source="sala_numer")
    wersja = WersjaJezykowaSerializer()

    class Meta:
        model = Seans
        fields = [
            "seans_id",
            "data_seansu",
            "film",
            "sala",
            "wersja",
            "slotnumer",
            "czas_trwania",
            "opis",
            "czas_rozpoczecia",
        ]
