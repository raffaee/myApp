# DEMO ONLY - Debian-packaged PHP so image scanners (Trivy, Grype) can match the
# php8.2 packages against Debian advisories for CVE-2026-109618 / CVE-2026-109619.
# bookworm/main carries php8.2 8.2.32-1~deb12u1, which Debian marks vulnerable.
# The fixed build is 8.2.35-1~deb12u1 (bookworm-security).
FROM debian:12.6

# Pin to the vulnerable package and ignore the security repo so it is not upgraded.
RUN printf 'deb http://deb.debian.org/debian bookworm main\n' > /etc/apt/sources.list \
 && rm -f /etc/apt/sources.list.d/* \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      php8.2-cli=8.2.32-1~deb12u1 \
      php8.2-common=8.2.32-1~deb12u1 \
      php8.2-mysql=8.2.32-1~deb12u1 \
      php8.2-opcache=8.2.32-1~deb12u1 \
      php8.2-readline=8.2.32-1~deb12u1 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Run `composer install` first so vendor/ exists in the build context.
COPY composer.json composer.lock ./
COPY src/ src/
COPY public/ public/
COPY vendor/ vendor/

EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
