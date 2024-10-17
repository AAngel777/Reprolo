% Padres de Albino y sus hermanos
padrede('Alfredo', 'Albino').
padrede('Martha', 'Albino').
padrede('Alfredo', 'Carlos').
padrede('Martha', 'Carlos').
padrede('Alfredo', 'Lucía').
padrede('Martha', 'Lucía').

% Hijos de Carlos y Lucía (primos)
padrede('Carlos', 'Diego').
padrede('Carlos', 'Sofía').
padrede('Lucía', 'Miguel').

% Hijos de Albino y Ana
padrede('Albino', 'Ángel').
padrede('Ana', 'Ángel').
padrede('Albino', 'Max').
padrede('Ana', 'Max').
padrede('Albino', 'Ariadna').
padrede('Ana', 'Ariadna').

% Reglas para definir relaciones adicionales
hijode(A, B) :- 
    padrede(B, A).

abuelode(A, B) :- 
    padrede(A, C), 
    padrede(C, B).

hermanode(A, B) :- 
    padrede(C, A), 
    padrede(C, B), 
    A \== B.

% Tío: A es tío de B si A es hermano de un padre de B
tiode(A, B) :- 
    hermanode(A, C), 
    padrede(C, B).

% Primo: A es primo de B si un padre de A es hermano de un padre de B
primode(A, B) :- 
    padrede(C, A), 
    tiode(C, B).

familiarde(A, B) :- 
    padrede(A, B).
familiarde(A, B) :- 
    hijode(A, B).
familiarde(A, B) :- 
    hermanode(A, B).
familiarde(A, B) :- 
    tiode(A, B).
familiarde(A, B) :- 
    primode(A, B).

