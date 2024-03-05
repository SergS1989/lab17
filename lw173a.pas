PROGRAM Stat(INPUT, OUTPUT);
VAR
  Ost, Sr, Min, Max, Sum, i, Digit, N: INTEGER;
  Ch: CHAR;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR 
  Ch: CHAR;
BEGIN  {ReadDigit}
  D := -1;
  IF NOT EOLN(F) AND NOT EOF(F)
  THEN
    BEGIN 
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9 
    END      
END;  {ReadDigit}
 
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Base: INTEGER;
BEGIN {ReadNumber}
  N := 0;
  Base := 10;
  ReadDigit(F, Digit);
  IF Digit = -1
  THEN
    N := -1;
  WHILE (Digit <> -1) AND (N <> -2)
  DO
    BEGIN
      IF N <= (MAXINT - Digit) / Base
      THEN
        BEGIN  
          N := N * Base + Digit;
          ReadDigit(F, Digit)
        END
      ELSE
        N := -2       
    END
END; {ReadNumber}
 
BEGIN {Stat}
  WRITELN(MAXINT);
  Sum := 0;
  i := 0;
  ReadNumber(INPUT, N);
  Max := N;
  Min := N;
  WHILE (N <> -2) AND (N <> -1)
  DO
    BEGIN
      IF Min >= N
      THEN
        Min := N;
      IF Max <= N
      THEN
        Max := N;     
      IF Sum <= MAXINT - N
      THEN
        Sum := Sum + N
      ELSE
        Sum := -3;
      i := i + 1;
      ReadNumber(INPUT, N)          
    END;
  IF N = -2
  THEN
    WRITELN('Error')
  ELSE
    BEGIN
      IF Sum = -3
      THEN
        WRITELN('Невозможно вывести среднее ', ' Max = ', Max, ' Min = ', Min)
      ELSE
        BEGIN
          Sr := Sum DIV i;
          Ost := ((Sum * 100) DIV i) MOD 100;
          IF Ost < 10
          THEN    
            WRITELN(' Sr =  ', Sr, ',', '0', Ost, ' Max = ', Max, ' Min = ', Min)
          ELSE
            WRITELN(' Sr =  ', Sr, ',', '0', Ost, ' Max = ', Max, ' Min = ', Min)  
        END  
    END  
             
END. {Stat}
