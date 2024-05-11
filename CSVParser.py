import json
from copy import copy
import mysql.connector
import pandas
import datetime
from temporaryObjects.Film import Film
import math
import re


class CSVParser:
    def __init__(self):
        pass

    @staticmethod
    def parse(filename, length):
        return pandas.read_csv(filename, sep="\t", skiprows=10700000)


def movies_metadata(path):
    return pandas.read_csv(path, nrows=7000)


if __name__ == "__main__":
    length = 5000
    films = {}
    # Extracting year, duration, isAdult
    data = movies_metadata("./data/movies_metadata.csv")
    f = open("./data/languages.json")
    dict_lang = {}
    lang_parsed = json.load(f)
    for lang in lang_parsed:
        dict_lang[lang["alpha2"]] = lang["English"]
    print(dict_lang)
    print(data.keys())
    for value in data.values:
        if str(value[8]) == "nan" or str(value[16]) == "nan" or int(value[16]) > 255:
            continue
        film = Film()
        film.id = value[5]
        if value[0] is True:  # isAdult
            film.age = 18
        film.title = value[8]
        if not str(value[9]) == "nan":
            film.short_description = value[9]
        if not str(value[14]) == "nan":
            if len(value[14]) == 10:
                # print(value[14])
                film.year = datetime.datetime.strptime(str(value[14]), "%Y-%m-%d").year
        film.duration = value[16]
        if not str(value[3]) == "[]":
            genres = value[3][1 : len(value[3]) - 1].replace("'", '"').split("},")
            for i in range(len(genres) - 1):
                genres[i] += "}"
            # print(genres)
            for genre in genres:
                # print(genre)
                g = json.loads(genre)
                # print(g)
                film.genres.append(g["name"])
        if not str(value[7]) == "nan" and not str(value[7]) == "xx":
            film.language = value[7]
        if film.id not in films:
            films[film.id] = film
        # print(film.genres)
        # print(film.language)
        # print(
        #     film.id,
        #     film.age,
        #     film.title,
        #     film.short_description,
        #     film.duration,
        #     film.year,
        # )
    # print(films)

    connection = mysql.connector.connect(
        user="cinema_admin",
        password="AiR2024@",
        host="air.mysql.database.azure.com",
        port=3306,
        database="mydb",
        ssl_ca=r"C:\ssl\Microsoft RSA Root Certificate Authority 2017.crt",
        ssl_disabled=False,
    )
    mycursor = connection.cursor()
    genres = {}
    languages = {}
    for film in films.values():
        for genre in film.genres:
            if genre not in genres:
                genres[genre] = genre
        if (
            film.language not in languages
            and film.language is not None
            and film.language != ""
        ):
            languages[film.language] = film.language
    # for gatunek in genres.values():
    #     mycursor.callproc(
    #         "dodaj_gatunek",
    #         [gatunek, None],
    #     )
    # connection.commit()

    for lang in languages:
        mycursor.callproc("dodaj_jezyk", [lang, None])
    connection.commit()

    for film in films.values():
        year = None
        # print(film.duration)
        if film.year is not None:
            if int(film.year) >= 1901:
                year = film.year
        # mycursor.callproc(
        #     "dodaj_film",
        #     [
        #         film.title,
        #         year,
        #         film.duration,
        #         film.short_description,
        #         film.long_description,
        #         film.age,
        #     ],
        # )
        # for gatunek in film.genres:
        #     # print(film.title)
        #     try:
        #         mycursor.callproc(
        #             "dodaj_gatunek_film", [gatunek, film.title, film.duration]
        #         )
        #     except:
        #         print("Error gatunek film", film.title)
        #         continue
        try:
            mycursor.callproc(
                "dodaj_jezyk_film", [film.language, film.title, film.duration]
            )
        except:
            print("Error jezyk film", film.title)
            continue
        connection.commit()

    # Close the cursor and connection
    # mycursor.close()
    # connection.close()

    """
        Próby z plikami tsv
    """

    # filename = (
    #     "data/title.basics.tsv"  # length: 10 759 885, after skip 100 000: year 1990
    # )
    # parsed = CSVParser.parse(filename, length)
    # print(len(parsed))
    # for value in parsed.values:
    #     # print(value)
    #     if value[1] != "movie" or value[7] == r"\N" or int(value[7]) >= 255:
    #         continue
    #     film = Film()
    #     id = value[0]
    #     film.titleId = id
    #     film.title = value[2]
    #     film.year = value[5]
    #     if int(value[4]) == 1:
    #         film.age = 18
    #     film.duration = value[7]
    #     if id not in films.keys():
    #         films[id] = film
