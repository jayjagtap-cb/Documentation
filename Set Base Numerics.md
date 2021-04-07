```
from cerebras.pb.kernel.common.kernel_numerics_pb2 import (
    KERNEL_NUMERICS_MODE_CONSERVATIVE,
    KERNEL_NUMERICS_MODE_BASE
)
config.matching.kernel.kernel_numerics_mode = KERNEL_NUMERICS_MODE_CONSERVATIVE
config.matching.kernel.intra_psum_dtype = T_F32
config.matching.kernel.inter_psum_dtype = T_F32
config.matching.kernel.sm_compute_dtype = T_F32
```
