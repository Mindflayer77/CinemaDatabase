from django.shortcuts import render, get_object_or_404

from django.http import HttpResponse, JsonResponse
from .models import (
    Aktor,
    Film,
    FilmWidok,
    FilmWidokDetail,
    FilmAktor,
    Kraj,
    RezyserFilm,
    Rezyser,
    JezykFilm,
    Jezyk,
    KrajProdukcji,
)
from django.template import loader


def index(request):
    return render(request, "cinemadb/index.html")


def detail_film(request, film_id):
    # films = (Film, film_id=film_id)
    # film = FilmWidokDetail.objects.all().filter(film_id=film_id)
    # actors = {}
    # # directors = {}
    # for f in film:
    #     a = {"imie": f.imie_aktor, "nazwisko": f.nazwisko_aktor}
    #     # d = {"imie": f.imie, "nazwisko": f.re}
    #     actors[f.imie_aktor + " " + f.nazwisko_aktor] = a
    # context = {"film": film[0], "actors": list(actors)}
    film = Film.objects.filter(film_id=film_id).first()
    film_aktor = FilmAktor.objects.filter(film_id=film_id)
    actors = []
    for f in film_aktor:
        actors.append(Aktor.objects.filter(aktor_id=f.aktor_id).first())
    rezyser_film = RezyserFilm.objects.filter(film_id=film_id)
    directors = []
    for r in rezyser_film:
        directors.append(Rezyser.objects.filter(rezyser_id=r.rezyser_id).first())
    jezyk_film = JezykFilm.objects.filter(film_id=film_id)
    language = []
    for j in jezyk_film:
        language.append(Jezyk.objects.filter(jezyk_id=j.jezyk_id).first())
    country_film = KrajProdukcji.objects.filter(film_id=film_id)
    country = []
    for k in country_film:
        country.append(Kraj.objects.filter(kraj_id=k.kraj_id).first())
    return render(
        request,
        "cinemadb/detail_film.html",
        {
            "film": film,
            "actors": actors,
            "directors": directors,
            "languages": language,
            "countries": country,
        },
    )


def get_films(request):
    films = list(FilmWidok.objects.values())
    return JsonResponse(films, safe=False)


def get_actors_for_film(request, film_id):
    film_aktor = FilmAktor.objects.all().filter(film_id=film_id)
    actors_list = []
    for f in film_aktor:
        actors_list.append(list(Aktor.objects.filter(aktor_id=f.aktor_id).values()))
    return JsonResponse(actors_list, safe=False)


def get_actor(request, actor_id):
    actor = Aktor.objects.all().filter(aktor_id=actor_id).first()
    country = Kraj.objects.filter(kraj_id=actor.kraj_id).first()
    film_aktor = FilmAktor.objects.filter(aktor_id=actor.aktor_id)
    films = []
    for f in film_aktor:
        films.append(Film.objects.filter(film_id=f.film_id).first())
    return render(
        request,
        "cinemadb/detail_aktor.html",
        {"actor": actor, "country": country, "films": films},
    )


def get_director(request, director_id):
    director = Rezyser.objects.all().filter(rezyser_id=director_id).first()
    country = Kraj.objects.filter(kraj_id=director.kraj_id).first()
    rezyser_film = RezyserFilm.objects.filter(rezyser_id=director_id)
    films = []
    for r in rezyser_film:
        films.append(Film.objects.filter(film_id=r.film_id).first())
    return render(
        request,
        "cinemadb/detail_rezyser.html",
        {"director": director, "country": country, "films": films},
    )


def library(request):
    return render(request, "cinemadb/library.html")
