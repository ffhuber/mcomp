# add keys (domains) to the redis server:
echo LPUSH moodle0.domain.com 0 | redis-cli
echo LPUSH moodle1.domain.com 1 | redis-cli
echo LPUSH moodle2.domain.com 2 | redis-cli
echo LPUSH moodle3.domain.com 3 | redis-cli