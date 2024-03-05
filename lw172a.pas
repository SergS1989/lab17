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
  Max := 0;
  Min := MAXINT;
  Sum := 0;
  i := 0;
  Sr := 0;
  WHILE (NOT EOLN) AND (N <> -2)
  DO
    BEGIN
      ReadNumber(INPUT, N);
      IF (N <> -1) AND (N <> -2)
      THEN
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
          i := i + 1        
        END
      ELSE
        BEGIN
          IF N = -2
          THEN
            WRITELN('ERROR');
        END  
   END;
  IF Sum = -3
  THEN
    WRITELN('Невозможно вывести среднее ', ' Max = ', Max, ' Min = ', Min)
  ELSE
    BEGIN
      Sr := Sum DIV i;
      IF (Sum MOD i = 0)
      THEN
        BEGIN
          Ost := 0;
        END
      ELSE
        BEGIN
          Ost := Sum MOD i;
          Ost := ((Ost * 10) DIV i) * 10;
        END;  
      WRITELN(' Sum = ', Sum, ' Sr =  ', Sr, ',', Ost, ' Max = ', Max, ' Min = ', Min)
    END  
             
END. {Stat}
