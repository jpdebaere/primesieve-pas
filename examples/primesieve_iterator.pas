(*  Iterate over primes using primesieve_iterator.  *)

program prime_iterator;
{$IF Defined(FPC)}
{$MODE Delphi}
{$ENDIF}

{$INLINE ON}
{$APPTYPE CONSOLE}

uses SysUtils, primesieve;

var
  it: primesieve_iterator;
  prime, sum: UInt64;

begin
  sum := 0;
  prime := 0;

  primesieve_init(it);
  (*  iterate over the primes below 10^9  *)
  prime := primesieve_next_prime(it);
  while prime < 1000000000 do
  begin
    Inc(sum, prime);
    prime := primesieve_next_prime(it);
  end;
  WriteLn(Format('Sum of the primes below 10^9 = %d', [sum]));

  (*  generate primes > 1000  *)
  primesieve_skipto(it, 1000, 1100);
  prime := primesieve_next_prime(it);
  while prime < 1100 do
  begin
    WriteLn(prime);
    prime := primesieve_next_prime(it);
  end;
  primesieve_free_iterator(it);
end.
