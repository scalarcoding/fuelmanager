List<String> uoilList = [
  'COLLY',
  'PKG',
  'ASSY',
  'DRUM',
  'EACH',
  'BOX',
  'SET',
  'TON',
  'SHEET',
  'BOTL',
  'KG',
  'MAP',
  'TIE',
  'IBC',
  'BNDL',
  'REAM',
];

String SHA1 = '6D:4F:2A:8B:37:D5:9F:19:F8:D9:4E:51:C5:34:4F:58:36:2C:CF:93';
String SHA256 =
    '5E:FB:7C:1E:2E:2A:5B:44:B6:2B:93:6A:A1:5D:AF:7F:A8:01:7F:7B:E6:E0:C4:8A:14:86:AA:EB:F1:CD:CF:D1';

String gsheetCredentials = r'''{
  "type": "service_account",
  "project_id": "logistrack",
  "private_key_id": "e3b57f5b0c5f8190950512fccb56ca7a8198a620",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCWCSNlYLCc0+no\nKiNlDaNBw/ZWHCMkfIYfELlLyyg7OPMa2EwAJtOuX1hCD+CbnhG2gV6RvmJOwuGL\nDQdlMz/OI3EAS0hXsuhzEg3oHEG9qQWg/RptsnF/mhWmbceVC5SruTlfjXs7SGBO\nxkGp2XHsEr4M77xFAoUY3n1c3UC9/V/TaMbqSjqz0tLrdsL4p4dLrNhNpX4qFhTH\nvVa3MnTiJAJVwd0LKkoXWVCbQKVMO9eLBuj+48tOjNvteHVdA6A5TqfkI/uozpIu\nPEPtHvBbQWWG2tpQmiOAtL16zqRzbhRg7tRMjjzpBNCQwAQOSF84aPQ6Am91M0av\nME/K6WatAgMBAAECggEADgZyqZ0SmsZwh4RmOfcUENIZv/jyDAzGmOF+Vih6l/ao\nkGoxyJMt7I9Qd8nLgaCSyqW99Q/VWW7RmKcHeZ1Yfz5EPPZ3Sm4YrqZnExCOe1qb\n18Mb6lno+Y2qLRxMBjxxPGWciGMjEZVKyMezBwai+0zROUexKMj7L3+fkRkZs+jL\n5KUHN/lL3fUS4LZTaKeO5KMqA1cFkHetkpt7WFYS4QczhIPUUa5fDA3tdKxDxpA5\njHBYS/2BxFP4YJL4UMHKyIqZ50+bqE5QOAN4ZFIWJy5CMALdYQEZCSH+CkFDToji\nsWc4bD4yL+Lau8vewan6Y1DTLQti32FotRGaW/NOvQKBgQDO+2lWM9ZeUXljIX+8\n5zFhg3tXqkluWvwP9vAXBlRRK9pO2/vpPERMJfDmGBIIn0b4cMo8gLKMgO6K3kT5\neIIumkOGkqSLEcDjXxBOMuth/Si10CpgucSHLeSPL/bz8lNYXDqo/ruYKdreulQm\nkf9DuuV28+vLzrGDuVe/MH/qzwKBgQC5kUUayPTgm6Q98jmZVvfi/50+V9lwraJa\nhbyFqd8waTc48NLGILdMsYDBp5cPcX5t1Ry0OTJT99kYXBoqbwKyHLxw3sWIE+14\nnK2pxIREul9VH1lnHGgu5usgSI84uVBIHhX/1xvENXJZafIFAecvTIRDQ+Rb98jP\nNjZqAsSFwwKBgGpRukoNVpAcSb4h9vuRxkvQvgrJ7e5BzjhlH+6z0ZvgasMXPM8R\npgN3eca3lovXRR1Y0olBknWZxO6QPd3niPdnRkhaCytkczBYJIgGn+I1qDO8Ogh1\nY/4MFNt4R+IHF8jLl1Y3gyUmWscN7yvg0r53wmbX5MdL5ONE0U3kG9EBAoGANf8d\neqPLDah8bEIVnJb/3p++o6twbCc6PNj5eHNrrGyRUxJQYrKWY8yqyK75d9bwkQkY\nJyEVkfVmyH3UZ1CSGj3eX4GTPPt/eD8vEV1Ll6wbnWtX2ncboboz5Nr4Qes6fyGy\nCRYQ0FE1CuuXLvnUyaCcQ+53foNlfVYrE0Hm6X0CgYAE6SPuXSOeE1KsFvbDwTyo\n7lvWtQKhzQ4uLfVUXOpkc6ivmyTus3v75r/yatS3y3ZSWN6TMxQ7XNtEyMOZztgp\nCHEBBy6DFCmd4g2DZs4Wb1ul8yzbyCnRXNUcAsEDEWy7y4jzAV4JmaVE+oNdcDZj\ngmw+vlf8WtS5ttZeRy3w5Q==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheetlogistrack@logistrack.iam.gserviceaccount.com",
  "client_id": "110981467610490625863",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheetlogistrack%40logistrack.iam.gserviceaccount.com"
}
''';

String gsheetId = '1KCQR0WA1v3lvmAZCYWBrUWK4hDcVj68Ka3-blb8jgzE';
