module NeutralLandscapes

import NaNMath
using Random: rand!

abstract type NeutralLandscapeMaker end
export NeutralLandscapeMaker

include("landscape.jl")
export rand, rand!

include(joinpath("algorithms", "nogradient.jl"))
export NoGradient

include(joinpath("algorithms", "planargradient.jl"))
export PlanarGradient

include(joinpath("algorithms", "edgegradient.jl"))
export EdgeGradient

include(joinpath("algorithms", "diamondsquare.jl"))
export DiamondSquare

include(joinpath("algorithms", "wavesurface.jl"))
export WaveSurface

include(joinpath("algorithms", "rectangularcluster.jl"))
export RectangularCluster

end # module
