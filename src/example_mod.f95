module example_mod
  public :: int_sum
contains
  function int_sum(i,j) result(k)
    integer :: i,j,k
    k = i + j
  end function int_sum
end module example_mod
