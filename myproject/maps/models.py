from django.db import models # type: ignore

class Cinema(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    district = models.CharField(max_length=100)
    phone = models.CharField(max_length=20)
    latitude = models.FloatField()  # Đổi từ lat -> latitude
    longitude = models.FloatField()  # Đổi từ lon -> longitude
    description = models.TextField(null=True, blank=True) 
    
    def __str__(self):
        return self.name
class CinemaImage(models.Model):
    cinema = models.ForeignKey('Cinema', on_delete=models.CASCADE, related_name='images')
    image_url = models.CharField(max_length=255)

    def __str__(self):
        return f"Image of {self.cinema.name}"
    
class Movie(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    duration = models.IntegerField(help_text="Thời lượng (phút)")
    release_date = models.DateField()
    poster_url = models.CharField(max_length=255)
    vote_count = models.IntegerField(null=True, blank=True)
    country = models.CharField(max_length=100, null=True, blank=True)
    production_company = models.CharField(max_length=255, null=True, blank=True)
    genre = models.CharField(max_length=255, null=True, blank=True)         # VD: "Kinh dị, Tâm lý"
    director = models.CharField(max_length=255, null=True, blank=True)      # VD: "Victor Vũ"
    actors = models.CharField(max_length=255, null=True, blank=True)        # VD: "Quốc Huy, Diễm My"
    trailer_url = models.URLField(null=True, blank=True)

    def __str__(self):
        return self.title