#
#  Created by Boyd Multerer on 10/03/17.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.Primitive.Transform.Pin do
  use Scenic.Primitive.Transform

  # serialized pin is always a 3-tuple of integers.  {x, y, z}


  #============================================================================
  # data verification and serialization

  #--------------------------------------------------------
  def info(), do: "Transform :pin must be a 2d, or 3d point {x,y} or {x,y,z}\n"

  #--------------------------------------------------------
  def verify( pin )
  def verify( {x,y} ) when is_number(x) and is_number(y), do: true
  def verify( {x,y,z} ) when is_number(x) and is_number(y) and is_number(z), do: true
  def verify( _ ), do: false

end