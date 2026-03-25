# Trong views.py
from django.shortcuts import render, get_object_or_404 # type: ignore
from .models import Movie
import json
from .models import Cinema


def phim(request):
    movies = Movie.objects.all()
    return render(request, 'maps/phim.html', {'movies': movies})
def trangchu(request):
    movies = Movie.objects.all()
    cinemas = Cinema.objects.all()  # Thêm truy vấn cho cinemas

    # Tạo cinemas_json tương tự như trong simplemap
    cinemas_list = []
    for cinema in cinemas:
        if cinema.latitude is not None and cinema.longitude is not None:
            cinemas_list.append({
                'name': cinema.name,
                'address': cinema.address,
                'district': cinema.district,
                'phone': cinema.phone,
                'latitude': float(cinema.latitude),
                'longitude': float(cinema.longitude),
            })

    cinemas_json = json.dumps(cinemas_list, ensure_ascii=False)

    context = {
        'movies': movies,
        'cinemas': cinemas,
        'cinemas_json': cinemas_json
    }
    return render(request, 'maps/trangchu.html', context)
def phim_detail(request, id):
    movie = get_object_or_404(Movie, id=id)
    return render(request, 'maps/phim_detail.html', {'movie': movie})
def rap(request, id):
    cinema = get_object_or_404(Cinema, id=id)
    return render(request, 'maps/rap.html', {'cinema': cinema})
def simplemap(request):
    cinemas = Cinema.objects.all()
    cinemas_list = []

    for cinema in cinemas:
        if cinema.latitude is not None and cinema.longitude is not None:
            cinemas_list.append({
                'name': cinema.name,
                'address': cinema.address,
                'district': cinema.district,
                'phone': cinema.phone,
                'latitude': float(cinema.latitude),
                'longitude': float(cinema.longitude),
            })

    cinemas_json = json.dumps(cinemas_list, ensure_ascii=False)  # Giữ unicode (tiếng Việt) khi render
    districts = Cinema.objects.values_list('district', flat=True).distinct()
    context = {
        'cinemas': cinemas,
        'cinemas_json': cinemas_json,
         'districts': districts,
    }
    return render(request, 'maps/simple-map.html', context)
