from django.shortcuts import render, get_object_or_404

from django.http import HttpResponse, JsonResponse
from .models import Aktor, Film, FilmWidok
from django.template import loader


def index(request):
    # actors = Aktor.objects.all()
    # context = {"actors": actors}
    return render(request, "cinemadb/index.html")


def detail(request, aktor_id):
    actor = get_object_or_404(Aktor, aktor_id=aktor_id)
    actor = Aktor.objects.all().filter(aktor_id=aktor_id)
    # print(actor.aktor_id)
    return HttpResponse(actor)


def results(request, aktor_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % aktor_id)


def vote(request, aktor_id):
    return HttpResponse("You're voting on question %s." % aktor_id)


def get_films(request):
    films = list(FilmWidok.objects.values())
    return JsonResponse(films, safe=False)


def library(request):
    return render(request, "cinemadb/library.html")
