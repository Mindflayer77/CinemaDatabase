# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Aktor(models.Model):
    aktor_id = models.AutoField(
        db_column="Aktor_Id", primary_key=True
    )  # Field name made lowercase.
    imie = models.CharField(
        db_column="Imie", max_length=45
    )  # Field name made lowercase.
    nazwisko = models.CharField(
        db_column="Nazwisko", max_length=45
    )  # Field name made lowercase.
    kraj_id = models.PositiveIntegerField(
        db_column="Kraj_Id", blank=True, null=True
    )  # Field name made lowercase.
    rok_urodzenia = models.TextField(
        db_column="Rok urodzenia", blank=True, null=True
    )  # Field name made lowercase. Field renamed to remove unsuitable characters. This field type is a guess.
    plec = models.PositiveIntegerField(db_column="Plec")  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=300, blank=True, null=True
    )  # Field name made lowercase.
    pseudonim = models.CharField(
        db_column="Pseudonim", max_length=50, blank=True, null=True
    )  # Field name made lowercase.

    def __str__(self):
        return (
            self.imie
            + " "
            + self.nazwisko
            + " "
            + str(self.rok_urodzenia)
            + " "
            # + self.pseudonim
            # + " "
            + self.opis
        )

    class Meta:
        managed = False
        db_table = "aktor"


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = "auth_group"


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey("AuthPermission", models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = "auth_group_permissions"
        unique_together = (("group", "permission"),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey("DjangoContentType", models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = "auth_permission"
        unique_together = (("content_type", "codename"),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "auth_user"


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = "auth_user_groups"
        unique_together = (("user", "group"),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = "auth_user_user_permissions"
        unique_together = (("user", "permission"),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey(
        "DjangoContentType", models.DO_NOTHING, blank=True, null=True
    )
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = "django_admin_log"


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = "django_content_type"
        unique_together = (("app_label", "model"),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "django_migrations"


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "django_session"


class Film(models.Model):
    film_id = models.AutoField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase.
    tytul = models.CharField(
        db_column="Tytul", max_length=100
    )  # Field name made lowercase.
    rok_produkcji = models.TextField(
        db_column="Rok produkcji", blank=True, null=True
    )  # Field name made lowercase. Field renamed to remove unsuitable characters. This field type is a guess.
    czas_trwania = models.PositiveIntegerField(
        db_column="Czas trwania"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis_krotki = models.CharField(
        db_column="Opis krotki", max_length=1000
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis_dlugi = models.CharField(
        db_column="Opis dlugi", max_length=2000, blank=True, null=True
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    grupa_wiekowa = models.PositiveIntegerField(
        db_column="Grupa_Wiekowa"
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "film"


class FilmAktor(models.Model):
    film_id = models.PositiveIntegerField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase. The composite primary key (Film_Id, Aktor_Id) found, that is not supported. The first column is selected.
    aktor_id = models.PositiveIntegerField(
        db_column="Aktor_Id"
    )  # Field name made lowercase.
    film = models.PositiveIntegerField(db_column="Film")  # Field name made lowercase.
    aktor = models.PositiveIntegerField(db_column="Aktor")  # Field name made lowercase.
    rola = models.CharField(
        db_column="Rola", max_length=200, blank=True, null=True
    )  # Field name made lowercase.
    postac = models.CharField(
        db_column="Postac", max_length=40
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "film_aktor"
        unique_together = (("film_id", "aktor_id"),)


class Gatunek(models.Model):
    gatunek_id = models.AutoField(
        db_column="Gatunek_Id", primary_key=True
    )  # Field name made lowercase.
    nazwa = models.CharField(
        db_column="Nazwa", max_length=30
    )  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "gatunek"


class GatunekFilm(models.Model):
    film_id = models.PositiveIntegerField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase. The composite primary key (Film_Id, Gatunek_Id) found, that is not supported. The first column is selected.
    gatunek_id = models.PositiveIntegerField(
        db_column="Gatunek_Id"
    )  # Field name made lowercase.
    film = models.PositiveIntegerField(db_column="Film")  # Field name made lowercase.
    gatunek = models.PositiveIntegerField(
        db_column="Gatunek"
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "gatunek_film"
        unique_together = (("film_id", "gatunek_id"),)


class GrupaWiekowa(models.Model):
    wiek = models.AutoField(
        db_column="Wiek", primary_key=True
    )  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "grupa_wiekowa"


class Jezyk(models.Model):
    jezyk_id = models.AutoField(
        db_column="Jezyk_Id", primary_key=True
    )  # Field name made lowercase.
    nazwa = models.CharField(
        db_column="Nazwa", max_length=30
    )  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "jezyk"


class JezykFilm(models.Model):
    jezyk_id = models.PositiveIntegerField(
        db_column="Jezyk_Id", primary_key=True
    )  # Field name made lowercase. The composite primary key (Jezyk_Id, Film_Id) found, that is not supported. The first column is selected.
    film_id = models.PositiveIntegerField(
        db_column="Film_Id"
    )  # Field name made lowercase.
    jezyk = models.PositiveIntegerField(db_column="Jezyk")  # Field name made lowercase.
    film = models.PositiveIntegerField(db_column="Film")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "jezyk_film"
        unique_together = (("jezyk_id", "film_id"),)


class Kraj(models.Model):
    kraj_id = models.AutoField(
        db_column="Kraj_Id", primary_key=True
    )  # Field name made lowercase.
    nazwa = models.CharField(
        db_column="Nazwa", max_length=60
    )  # Field name made lowercase.
    skrot = models.CharField(
        db_column="Skrot", max_length=45
    )  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=200, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "kraj"


class KrajProdukcji(models.Model):
    film_id = models.PositiveIntegerField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase. The composite primary key (Film_Id, Kraj_Id) found, that is not supported. The first column is selected.
    kraj_id = models.PositiveIntegerField(
        db_column="Kraj_Id"
    )  # Field name made lowercase.
    film = models.PositiveIntegerField(db_column="Film")  # Field name made lowercase.
    kraj = models.PositiveIntegerField(db_column="Kraj")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "kraj_produkcji"
        unique_together = (("film_id", "kraj_id"),)


class Rezyser(models.Model):
    rezyser_id = models.AutoField(
        db_column="Rezyser_Id", primary_key=True
    )  # Field name made lowercase.
    imie = models.CharField(
        db_column="Imie", max_length=45
    )  # Field name made lowercase.
    nazwisko = models.CharField(
        db_column="Nazwisko", max_length=45
    )  # Field name made lowercase.
    kraj_id = models.PositiveIntegerField(
        db_column="Kraj_Id", blank=True, null=True
    )  # Field name made lowercase.
    rok_urodzenia = models.TextField(
        db_column="Rok_urodzenia", blank=True, null=True
    )  # Field name made lowercase. This field type is a guess.
    plec = models.PositiveIntegerField(db_column="Plec")  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=300, blank=True, null=True
    )  # Field name made lowercase.
    pseudonim = models.CharField(
        db_column="Pseudonim", max_length=45, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "rezyser"


class RezyserFilm(models.Model):
    rezyser_id = models.PositiveIntegerField(
        db_column="Rezyser_Id", primary_key=True
    )  # Field name made lowercase. The composite primary key (Rezyser_Id, Film_Id) found, that is not supported. The first column is selected.
    film_id = models.PositiveIntegerField(
        db_column="Film_Id"
    )  # Field name made lowercase.
    rezyser = models.PositiveIntegerField(
        db_column="Rezyser"
    )  # Field name made lowercase.
    film = models.PositiveIntegerField(db_column="Film")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "rezyser_film"
        unique_together = (("rezyser_id", "film_id"),)


class Sala(models.Model):
    sala_numer = models.PositiveIntegerField(
        db_column="Sala_numer", primary_key=True
    )  # Field name made lowercase.
    liczba_miejsc = models.PositiveSmallIntegerField(
        db_column="Liczba miejsc"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "sala"


class Seans(models.Model):
    seans_id = models.AutoField(
        db_column="Seans_Id", primary_key=True
    )  # Field name made lowercase.
    data_seansu = models.DateField(
        db_column="Data_seansu"
    )  # Field name made lowercase.
    film_id = models.PositiveIntegerField(
        db_column="Film_Id"
    )  # Field name made lowercase.
    sala_numer = models.PositiveIntegerField(
        db_column="Sala_numer"
    )  # Field name made lowercase.
    wersja_id = models.PositiveIntegerField(
        db_column="Wersja_Id"
    )  # Field name made lowercase.
    slotnumer = models.PositiveIntegerField(
        db_column="SlotNumer"
    )  # Field name made lowercase.
    czas_trwania = models.PositiveIntegerField(
        db_column="Czas trwania"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis = models.CharField(
        db_column="Opis", max_length=200, blank=True, null=True
    )  # Field name made lowercase.
    czas_rozpoczecia = models.TimeField(
        db_column="Czas_rozpoczecia"
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "seans"


class Slot(models.Model):
    slot_numer = models.AutoField(
        db_column="Slot_numer", primary_key=True
    )  # Field name made lowercase.
    godzina_rozpoczecia = models.TimeField(
        db_column="Godzina rozpoczecia"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    godzina_zakonczenia = models.TimeField(
        db_column="Godzina zakonczenia"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "slot"


class WersjaJezykowa(models.Model):
    wersja_id = models.AutoField(
        db_column="Wersja_Id", primary_key=True
    )  # Field name made lowercase.
    typ = models.CharField(db_column="Typ", max_length=30)  # Field name made lowercase.
    jezyk_id = models.PositiveIntegerField(
        db_column="Jezyk_Id"
    )  # Field name made lowercase.
    opis = models.CharField(
        db_column="Opis", max_length=100, blank=True, null=True
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "wersja_jezykowa"


class FilmWidok(models.Model):
    film_id = models.AutoField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase.
    tytul = models.CharField(
        db_column="Tytuł", max_length=100
    )  # Field name made lowercase.
    rok_produkcji = models.TextField(
        db_column="Rok produkcji", blank=True, null=True
    )  # Field name made lowercase. Field renamed to remove unsuitable characters. This field type is a guess.
    grupa_wiekowa = models.PositiveIntegerField(
        db_column="Grupa_Wiekowa"
    )  # Field name made lowercase.
    opis_krotki = models.CharField(
        db_column="Opis krótki", max_length=1000
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    czas_trwania = models.PositiveIntegerField(
        db_column="Czas trwania"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    imie = models.CharField(db_column="Imię", max_length=45)
    nazwisko = models.CharField(db_column="Nazwisko", max_length=45)

    class Meta:
        managed = False
        db_table = "film_widok"


class FilmWidokDetail(models.Model):
    film_id = models.AutoField(
        db_column="Film_Id", primary_key=True
    )  # Field name made lowercase.
    tytul = models.CharField(
        db_column="Tytuł", max_length=100
    )  # Field name made lowercase.
    rok_produkcji = models.TextField(
        db_column="Rok produkcji", blank=True, null=True
    )  # Field name made lowercase. Field renamed to remove unsuitable characters. This field type is a guess.
    grupa_wiekowa = models.PositiveIntegerField(
        db_column="Grupa wiekowa"
    )  # Field name made lowercase.
    opis_krotki = models.CharField(
        db_column="Opis krótki", max_length=1000
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    opis_dlugi = models.CharField(db_column="Opis długi", max_length=2000)
    czas_trwania = models.PositiveIntegerField(
        db_column="Czas trwania"
    )  # Field name made lowercase. Field renamed to remove unsuitable characters.
    imie_rezyser = models.CharField(db_column="Imię", max_length=45)
    nazwisko_rezyser = models.CharField(db_column="Nazwisko", max_length=45)
    imie_aktor = models.CharField(db_column="IMAK", max_length=45)
    nazwisko_aktor = models.CharField(db_column="NAAK", max_length=45)
    kraj = models.CharField(db_column="KRANA", max_length=60)
    kraj_skrot = models.CharField(db_column="Skrót", max_length=45)
    gatunek = models.CharField(db_column="GATNA", max_length=30)
    jezyk = models.CharField(db_column="JENA", max_length=30)

    class Meta:
        managed = False
        db_table = "film_szczegolowo"
