import os
from datetime import datetime
from os.path import exists

LICENSE = 'BSD'
VERSION = '0.5.0'

output_root = 'generated'

output_directories = {
    'messages': '{}/messages',
    'sources': '{}/sources',
    'headers': '{}/headers',
    'mappings': '{}/mappings',
    'wrapper': '{}/epl_wrapper'
}

for key in output_directories:
    output_directories[key] = output_directories[key].format(output_root)

ignored_directories = [
    output_directories['wrapper']
]


def create_directories():
    for directory in output_directories.values():
        if directory in ignored_directories:
            continue
        if not exists(directory):
            os.makedirs(directory, exist_ok=True)


def fill_header(text):
    text = text.replace('$LICENSE', LICENSE)
    text = text.replace('$VERSION', VERSION)
    text = text.replace('$TIMESTAMP', datetime.now().strftime('%c'))
    return text
