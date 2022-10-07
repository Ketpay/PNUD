from django.utils.timezone import now
from django.utils import timezone
from db_pnud.models import *
from rest_framework.authtoken.models import Token
from datetime import timedelta

def Token_expired(token):
	time=now().date()
	# time=now()+timedelta(days=1)
	# time=time.date()
	key=Token.objects.filter(key=token).last()
	expired=key.created+timedelta(days=1)

	if time>=expired.date():
		val=True
		key.delete()
	else:
		val=False
	return val
