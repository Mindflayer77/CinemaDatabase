from django.urls import path

from . import views

app_name = "cinemadb"
urlpatterns = [
    path("", views.index, name="index"),
    path("actors/<int:aktor_id>/", views.detail, name="detail"),
    path("actors/<int:aktor_id>/results/", views.results, name="results"),
    path("actors/<int:aktor_id>/vote/", views.vote, name="vote"),
]
