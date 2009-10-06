from django.conf.urls.defaults import *


urlpatterns = patterns('',
    url(r'^$', 'HelloWorld.views.index'),
    url(r'^(.*)$', 'HelloWorld.views.detail'),
)