" vim: filetype=python
ParseThisSnippetFile
finish

:snippet main
if __name__ == '__main__':

:snippet log
self._log = logging.getLogger('{}.{}'.format(__name__, self.__class__.__name__))

:snippet class
class <@>(object):
    """Class.
    """

    def __init__(self):
    """Create a new.
    """
        pass

:snippet d function
def <@>():
    """Function does something.
    """
    pass

:snippet def Class method
def <@>(self,):
    """Method Does something.
    """
    pass

:snippet unittest
import unittest
import logging


class TestingClass(unittest.TestCase):

    def __init__(self, *args, **kwargs):
        super(TestingClass, self).__init__(*args, **kwargs)
        self._log = logging.getLogger('{}.{}'.format(__name__, self.__class__.__name__))

    def test(self):
        actual = 1
        self.assertEquals(1, actual)


logging.basicConfig(level=logging.DEBUG)
unittest.main()
