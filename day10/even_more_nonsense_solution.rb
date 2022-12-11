              p $data.split(
          ?\n).           map{[
        _1[0                ].ord%
      14-11,                 _1[5..].
    to_i]}.                    inject([
  0,1,0]){|(c                 ,x,s),(i,n)
  |i.times                       {c+=1;c%
    40==20?s+=c            *x:0;print((
      x-1..x+1).             cover?((
        c-1)%40             )??#:?.
          );c%              40==
            0?puts:   _=_};x+=
              n;[c,x  ,s,]}.
                   last
