#!/usr/bin/env bash

clean () {
    sed "s/^\[/\\\[/g" | sed "s/\"/'/g" | sed 's/\!/❕/g'
}

get_sender () {
    grep -o '^From: \(.*\)$' $1 | sed "s/^From: //g" | clean
}

get_subject () {
    grep -o '^Subject: \(.*\)$' $1 | sed "s/^Subject: //g" | perl -pe 'use MIME::Words(decode_mimewords); $_=decode_mimewords($_);' | clean
}

notify () {
    account=$1
    previous_messages=/tmp/offlineimap-$account-messages
    maildir="$HOME/.mail/$account/inbox/new"

    if [ ! -e $previous_messages ]; then
        touch $previous_messages
    fi

    for file in $maildir/*; do
        if [ ! -f $file ]; then
            continue
        fi

        filename=$(basename $file)
        if grep -Fxq $filename $previous_messages; then
            : echo "seen"
        else
            echo $filename >> $previous_messages
            sender="`get_sender $file`"
            subject=`get_subject $file`
            message="New message for $account"

            if [ -e /usr/local/bin/terminal-notifier ]; then
                terminal-notifier -title $subject -subtitle $sender -message $message -sender 'org.gnu.Emacs' -activate 'org.gnu.Emacs'
            fi
        fi
    done
}

mu index
notify $1
