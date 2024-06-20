function todosTienenFormatoEnLinea ( tfmt : TipoFormato; ini, fin : RangoColumna
                                   ; ln : Linea ) : boolean;
{ Retorna true solo si todos los caracteres de `ln` entre las columnas `ini` y `fin`, 
  incluídos los extremos, tienen el formato `tfmt`. En otro caso retorna false. 

  Precondiciones: 1 <= ini <= ln.tope
                  1 <= fin <= ln.tope }
var
  i: integer;
  verifForm: Boolean;
begin
  i:=ini;
  verifForm := true;
  
  while (i <= fin) and verifForm do
  begin
    if (not ln.cars[i].fmt[tfmt]) then
    verifForm := false;

  i := i + 1;
  end;
  todosTienenFormatoEnLinea:=verifForm;
end;


procedure aplicarFormatoEnLinea ( tfmt : TipoFormato; ini, fin : RangoColumna
                                ; var ln : Linea );
{ Aplica el formato `tfmt` a los caracteres de `ln` entre las columnas `ini` y `fin`, 
  incluídos los extremos. 
  Si todos los carácteres ya tienen el tipo de formato `tfmt`, en lugar de aplicarlo 
  lo quita.

  Precondiciones: 1 <= ini <= ln.tope
                  1 <= fin <= ln.tope }
var 
      i: integer;
begin
i:=ini;
  if todosTienenFormatoEnLinea(tfmt,ini, fin,ln) then 
  begin
    for i:=ini to fin do
      begin
        ln.cars[i].fmt[tfmt]:=false;
      end
  end
  else
      ln.cars[i].fmt[tfmt]:=true;
end;



function contarCaracteresEnTexto ( txt : Texto ) : integer;
var
  count,i: integer;
  actual: Texto;
begin
  count := 0;
  actual := txt;
  while actual <> nil do
  begin
    for i:=1 to actual^.info.tope do
    begin
      count := count + 1;  
    end;
    actual := actual^.sig; 
  end;
  contarCaracteresEnTexto := count; 
end;


procedure buscarCadenaEnLineaDesde ( c : Cadena; ln : Linea; desde : RangoColumna
                                   ; var pc : PosibleColumna );
{ Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la 
  columna `desde`. Si la encuentra, retorna en `pc` la columna en la que incia. 

  Precondiciones: 1 <= desde <= ln.tope }

begin
end;

procedure buscarCadenaEnTextoDesde ( c : Cadena; txt : Texto; desde : Posicion
                                   ; var pp : PosiblePosicion );
{ Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la 
  posición `desde`. Si la encuentra, retorna en `pp` la posición en la que incia. 
  La búsqueda no encuentra cadenas que ocupen más de una línea.

  Precondiciones: 1 <= desde.linea <= cantidad de líneas 
                  1 <= desde.columna <= tope de línea en desde.linea } 
begin
end;



procedure insertarCadenaEnLinea ( c : Cadena; columna : RangoColumna
                                ; var ln : linea; var pln : PosibleLinea );
{ Inserta la cadena `c` a partir de la `columna` de `ln`, y desplaza hacia la derecha 
  a los restantes caracteres de la línea. Los carácteres insertados toman el formato 
  del carácter que ocupaba la posición `columna` en la línea. Si la columna es 
  `ln.tope+1`, entonces queda sin formato.
  Si (c.tope + lin.tope) supera `MAXCOL`, los carácteres sobrantes se retornan (en
  orden) en la posible línea `pln`.
 
  Precondiciones:  1 <= columna <= ln.tope+1
                   columna <= MAXCOL
                   c.tope + columna <= MAXCOL  }  
begin
end;


procedure insertarLineaEnTexto ( ln : Linea; nln : integer; var txt : Texto );
{ Inserta la línea `ln` en la posición `nlin` del texto `txt`.

  Precondiciones: 1 < nln <= cantidad de líneas del texto + 1
}
begin
end;
