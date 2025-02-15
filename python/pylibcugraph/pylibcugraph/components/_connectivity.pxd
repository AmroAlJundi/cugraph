# Copyright (c) 2019-2023, NVIDIA CORPORATION.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# cython: profile=False
# distutils: language = c++
# cython: embedsignature = True
# cython: language_level = 3

from pylibcugraph.structure.graph_primtypes cimport *
from pylibcugraph.structure.graph_utilities cimport *


cdef extern from "cugraph/algorithms.hpp" namespace "cugraph":

    ctypedef enum cugraph_cc_t:
        CUGRAPH_STRONG "cugraph::cugraph_cc_t::CUGRAPH_STRONG"
        NUM_CONNECTIVITY_TYPES "cugraph::cugraph_cc_t::NUM_CONNECTIVITY_TYPES"

    cdef void connected_components[VT,ET,WT](
        const GraphCSRView[VT,ET,WT] &graph,
        cugraph_cc_t connect_type,
        VT *labels) except +

cdef extern from "cugraph/utilities/cython.hpp" namespace "cugraph::cython":
    cdef void call_wcc[vertex_t, weight_t](
        const handle_t &handle,
        const graph_container_t &g,
        vertex_t *identifiers) except +

