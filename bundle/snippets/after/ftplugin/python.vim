" vim: filetype=python
ParseThisSnippetFile
finish

:snippet cli
#!/usr/bin/python
"""
SYNOPSIS

    TODO: my_cli_script [-h]

DESCRIPTION

    TODO: Add description

EXAMPLES

    TODO: $ ./my_cli_script

EXIT STATUS

    TODO: update
    0 on success
    1 on failures

AUTHOR

    Juan D Frias <juandfrias@gmail.com>
"""

import sys
import logging
import argparse


class ProcessingError(Exception):
    def __init__(self, *args, **kwargs):
        Exception.__init__(self, *args, **kwargs)


def main(args):

    # Process file

    # for line in args.file:
    #     print line.strip()

    # TODO: Do your thing ...
    raise ProcessingError('Not implemented')

    return 0


if __name__ == '__main__':
    try:

        # arg parer
        parser = argparse.ArgumentParser(description='TODO: Add description')
        # TODO: parser.add_argument('file', metavar='<file>', type=argparse.FileType(), help='input file')
        parser.add_argument('-v', dest='loglevel', action='store_const', const='DEBUG', default='INFO', help='verbose')
        args = parser.parse_args()

        # logging
        logging.basicConfig(format='%(asctime)-15s %(levelname)s %(message)s', level=args.loglevel)
        logger = logging.getLogger(__name__)

        # main
        sys.exit(main(args))

    except KeyboardInterrupt:
        print '\nInterrupted!'

    except ProcessingError as e:
        if e.args:
            logger.error(e.args[0])

        if len(e.args) > 1:
            logger.debug('Cause: %s', e.args[1:])

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
