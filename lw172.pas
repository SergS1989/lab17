PROGRAM Read(INPUT, OUTPUT);
VAR
  Digit, N: INTEGER;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR 
  Ch: CHAR;
BEGIN  {ReadDigit}
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
    ELSE
      D := -1;
   END
 ELSE
   D := -1      
END;  {ReadDigit}
 
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Base, Digit: INTEGER;
BEGIN
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
END;
 
BEGIN {Read}
  WRITELN(MAXINT);
  ReadNumber(INPUT, N);
  WRITELN(N)      
END. {Read}
