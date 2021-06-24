import re

def gmail_nametrans(foldername):
    return re.sub('^\[gmail\].', '', 
            re.sub('all_mail', 'archive',
            re.sub('sent_mail', 'sent',
            re.sub('starred', 'flagged',
            re.sub('bin', 'trash',
            re.sub(' ', '_', foldername.lower()))))))
