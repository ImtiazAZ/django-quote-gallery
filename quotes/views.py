from django.http import JsonResponse
from .models import Quote

def quote_list(request):
    quotes = Quote.objects.all()
    data = [{"author": q.author, "text": q.text} for q in quotes]
    return JsonResponse(data, safe=False)
