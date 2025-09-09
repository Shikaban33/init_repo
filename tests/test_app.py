import sys
import unittest
from io import StringIO

from project.app import test


class TestHelloWorld(unittest.TestCase):
    def test_print_output(self):
        captured_output = StringIO()
        sys.stdout = captured_output
        test()
        sys.stdout = sys.__stdout__
        self.assertEqual(captured_output.getvalue(), "Hello world\n")
