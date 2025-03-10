module Bottle::Internal::Dtype
  alias Integer = LibC::Int
  alias Real = LibC::Float
  alias Double = LibC::Double
  alias Logical = LibC::Char
  alias Ftnlen = LibC::Int
  alias LFp = Pointer(Void)
  alias UInt = LibC::SizeT
  alias Indexer = UInt64 | Int32
  alias BNum = Int32 | Float64 | Float32
end
