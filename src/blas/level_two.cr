require "../libs/dtype"
require "../libs/cblas"
require "../core/flask"
require "../core/jug"

module Bottle
  macro blas_helper(dtype, blas_prefix, cast)
    module Bottle::BLAS
      extend self
    end
  end
end
