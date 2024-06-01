from django.urls import path

from . import views

app_name = "cinemadb"
urlpatterns = [
    path("", views.index, name="index"),
    path("films/<int:film_id>/", views.detail_film, name="detail_film"),
    path(
        "film_actors/<int:film_id>",
        views.get_actors_for_film,
        name="get_actors_for_film",
    ),
    path("films", views.get_films, name="get_films"),
    path("actor/<int:actor_id>", views.get_actor, name="get_actor"),
    path("library", views.library, name="library"),
]
