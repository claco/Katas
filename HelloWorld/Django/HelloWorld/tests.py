"""
This file demonstrates two different styles of tests (one doctest and one
unittest). These will both pass when you run "manage.py test".

Replace these with more appropriate tests for your application.
"""

from django.test import TestCase
from django.test.client import Client

class SimpleTest(TestCase):
    def setUp(self):
        self.client = Client()

    def test_hello_world(self):
        """
        Tests that /hello returns hello world.
        """
        response = self.client.get('/hello/')
        self.assertContains(response, 'hello world', count=1, status_code=200)

    def test_hello_x(self):
        """
        Tests that /hello/x returns hello x.
        """
        response = self.client.get('/hello/chris')
        self.assertContains(response, 'hello chris', count=1, status_code=200)