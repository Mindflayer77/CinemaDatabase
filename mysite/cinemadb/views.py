from django.shortcuts import render

from django.http import HttpResponse
from .models import Aktor
from django.template import loader


def index(request):
    actors = Aktor.objects.all()
    output = " ".join([a.nazwisko for a in actors])
    template = loader.get_template("cinemadb/index.html")
    context = {
        "actors": actors,
    }
    return render(request, "cinemadb/index.html", context)


def detail(request, aktor_id):
    actor = Aktor.objects.get(aktor_id=aktor_id)
    return HttpResponse(actor)


def results(request, aktor_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % aktor_id)


def vote(request, aktor_id):
    return HttpResponse("You're voting on question %s." % aktor_id)
