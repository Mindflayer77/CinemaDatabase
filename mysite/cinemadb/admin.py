from django.contrib import admin


from .models import (
    Aktor,
    Film,
    FilmAktor,
    Gatunek,
    GatunekFilm,
    GrupaWiekowa,
    Jezyk,
    JezykFilm,
    Kraj,
    KrajProdukcji,
    Rezyser,
    RezyserFilm,
    Sala,
    Seans,
    Slot,
    WersjaJezykowa,
)

admin.site.register(Aktor)
admin.site.register(Film)
admin.site.register(FilmAktor)
admin.site.register(Gatunek)
admin.site.register(GatunekFilm)
admin.site.register(GrupaWiekowa)
admin.site.register(Jezyk)
admin.site.register(JezykFilm)
admin.site.register(Kraj)
admin.site.register(KrajProdukcji)
admin.site.register(Rezyser)
admin.site.register(RezyserFilm)
admin.site.register(Sala)
admin.site.register(Seans)
admin.site.register(Slot)
admin.site.register(WersjaJezykowa)
# Register your models here.
