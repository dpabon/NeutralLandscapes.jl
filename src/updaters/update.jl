"""
    This file contains methods for simulating change in a
    landscape with expected amounts of spatial and temporal 
    autocorrelation. 
"""

"""
    NeutralLandscapeUpdater is an abstract type for methods
    for updating a landscape matrix
"""
abstract type NeutralLandscapeUpdater end 

"""
    All `NeutralLandscapeUpdater`s have a field `rate`
    which defines the expected change in any cell per timestep.  
"""
rate(up::NeutralLandscapeUpdater) = up.rate

"""
    All `NeutralLandscapeUpdater`'s have a `spatialupdater` field
    which is either a `NeutralLandscapeMaker`, or `Missing` (in the case
    of temporally correlated updaters).
"""
spatialupdater(up::NeutralLandscapeUpdater) = up.spatialupdater

"""
    TODO rate and direction should have different names to clarify what they actually are

"""
variability(up::NeutralLandscapeUpdater) = up.variability


function update(updater::T, mat) where {T<:NeutralLandscapeUpdater}
    _update(updater, mat)
end
function update(updater::T, mat, n::I) where {T<:NeutralLandscapeUpdater, I<:Integer}
    sequence = [zeros(size(mat)) for _ in 1:n]
    sequence[begin] .= mat
    for i in 2:n
        sequence[i] = _update(updater, sequence[i-1])
    end
    sequence
end
function update!(updater::T, mat) where {T<:NeutralLandscapeUpdater}
    mat .= _update(updater, mat)
end

