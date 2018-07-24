# Cl-Zendesk

Common Lisp Zendesk API Client

## Usage

### connect

connect with password

```lisp
(defvar *conn* (connect/password "https://obscura.zendesk.com/" "jdoe@example.com" "pa$$w0rd"))
```

connect with token

```lisp
(defvar *conn* (connect/token "https://obscura.zendesk.com/" "jdoe@example.com" "6wiIBWbGkBMo1mRDMuVwkw1EPsNkeUj95PIz2akv"))
```

connect with oauth

comming soon.

### search

```lisp
(defvar result (search *conn* "type:user tags:premium_support"))
(count result)
=> 500

(svref (results result) 0)
=> <user>
(email (svref (results result) 0))
=> "jdoe@example.com"

(setf result (next-page result))
=> <user>


(with-search-query (user *conn* "type:user tags:premium_support")
  (format T "~A:~A" (email user) (last-login-at user)))
;; aaa@example.com:2018-07-18T00:00:00Z
;; bbb@example.com:2018-07-18T03:04:00Z
;; ccc@example.com:2018-07-18T10:00:00Z
;; ddd@example.com:2018-07-18T12:00:00Z
```


## Installation

## API

### connect

`connect/password`
`connect/token`

### search

`search`
`with-search-query`


## Author

* tamura shingo (tamura.shingo@gmail.com)

## Copyright

Copyright (c) 2018 tamura shingo (tamura.shingo@gmail.com)

## License

Licensed under the MIT License.
