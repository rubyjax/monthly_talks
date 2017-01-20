# 19Jan17 Mystery Code Challenge!

tonight we will present a small coding challenge with two primary features:
* pair programming with a random person
* integrating with a mail service (we'll use Mailgun for this)

## pair programming

underneath the table is an envelope. inside is a raffle ticket and a number. the
raffle ticket is for later and the number matches a different envelope with the
same number. keep the raffle ticket secure for later and find the person with the
matching number--that is your pair to program with tonight!

## integrating with Mailgun

in _any language_ you and your pair choose, use the following [Mailgun documentation](https://documentation.mailgun.com/api_reference.html#api-reference) to
code an interface that does the following:
* sends emails with a subject, text and campaign id to any email address
* detects if a given email address is listed in a suppressions (do not contact) list
* gets the list of previously sent emails to a given email address

oh, and...

make sure you write tests :)

you will need to create your own Mailgun account to accomplish this task.
