  r=$data.
split(
  0xa.
  chr
    ).
    map {
      |l|l.
      split(
        0x2c.
        chr
          ).
          map {
            _1.
            split(
              0x2d.
              chr
                ).
                map(
                  &("$=&]?:0``\n".
                unpack(
                  "u")[0].
              to_sym
                ))}.
            map {
              _1.._2}};p r.
          count {
            _1.
        cover?(
          _2)||_2.
      cover?(_1)
        };p r.
    count {
      _1.
  end >=
    _2.
begin &&
  _2.
end >=
  _1.
  begin
    }
