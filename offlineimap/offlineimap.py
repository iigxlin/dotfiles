import re

def gmail_nametrans(foldername):
    return re.sub('^\[gmail\].', '', 
            re.sub('all_mail', 'archive',
            re.sub('sent_mail', 'sent',
            re.sub('starred', 'flagged',
            re.sub('bin', 'trash',
            re.sub(' ', '_', foldername.lower()))))))

def gmail_folderfilter(foldername):
    return foldername in ('INBOX', '[Gmail]/Starred',
            '[Gmail]/Drafts', '[Gmail]/All Mail')
