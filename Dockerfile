FROM judge0/judge0:latest

# Chỉ định các ngôn ngữ cần giữ lại
ENV ENABLED_LANGUAGES="c cpp csharp java nodejs typescript python"

# Loại bỏ các thư viện ngôn ngữ không cần thiết để tối ưu dung lượng
RUN rm -rf /usr/local/bash-* \
  /usr/local/elixir-* \
  /usr/local/erlang-* \
  /usr/local/groovy-* \
  /usr/local/go-* \
  /usr/local/haskell-* \
  /usr/local/kotlin-* \
  /usr/local/perl-* \
  /usr/local/rust-* \
  /usr/local/swift-* \
  /usr/local/sql-* \
  /usr/local/scala-* \
  /usr/local/octave-* \
  /usr/local/r \
  /usr/local/clojure-* \
  /usr/local/clisp-* \
  /usr/local/prolog-* \
  /usr/local/pascal-* \
  /usr/local/lisp-* \
  /usr/local/coffeescript-* \
  /usr/local/vbnc \
  /usr/local/mlton-* \
  /usr/local/fsharp-* \
  /usr/local/cobol-*

# Xóa bỏ các dependencies không cần thiết
RUN apt-get purge -y \
  bash \
  elixir \
  erlang \
  groovy \
  golang \
  haskell-platform \
  kotlin \
  perl \
  rustc \
  swift \
  sqlite3 \
  scala \
  octave \
  r-base \
  clojure \
  clisp \
  gprolog \
  fp-compiler \
  coffeescript \
  vbnc \
  mlton \
  fsharp \
  open-cobol \
  && apt-get autoremove -y && apt-get clean

# Đảm bảo cấu hình
COPY judge0.conf /judge0.conf
