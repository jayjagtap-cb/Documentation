import numpy as np
import os
from cerebras.common.git import get_gittop

tensor_dir = "tests/stack/full/test_153_gsk_gat/workdir-test_153_gsk_gat-test_run-test_simfabric-qm9-nano.20210330.1127.48.1/cs_sim_op/reconstructed_tensors"
def main():
    """
    Algorithm
    A. Check if tensor_nlinrxact == tensor_nlinrxact2
        Load tensors and check on a granular level, expected to be same

    FWD PASS
    1. Load all tensor_nlin1-6.rxact2.npy and nlin_txact1-6.rxact.npy
    2. ref_txact = nlin_rxact*alpaha where alpha = 0.2
    3. Compare ref_txact with nlin_txact
        i. Check on a granular level
        ii. Output np.max(ref-src) at mismatch tensor

    BWD PASS
    1. Load tensor_nlin1-6.txdelta.npy
    2. ref_txdelta = rxdelta if rxact > 0 else ref_txdelta = rxdelta*alpha where alpha =0.2
    3. Compare ref_txdelta with nlin_txdelta

    """
    compare_nlin_rxact_vs_nlin_rxact2()
    check_fwd_pass()
    check_bwd_pass()


def compare_nlin_rxact_vs_nlin_rxact2():
    """
    All 6 tensor_nlin*rxact
    """
    tensor_path = os.path.join(get_gittop(), tensor_dir)
    print("=========================================================================")
    print(f"{bcolors.HEADER}Comparing tensor_nlin*rcxact vs tensor_nlin_rxact2 {bcolors.ENDC}")

    for i in range(1,7):
        nlin_rxact = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.rxact.npy"))
        nlin_rxact2 = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.rxact2.npy"))
        granular_comparison(nlin_rxact, nlin_rxact2, f"tensor_nlin{i}.rxact.npy", f"tensor_nlin{i}.rxact2.npy")
    
    print("Granular Comparisons posssible from script.")
    print("=========================================================================")

def check_fwd_pass():
    tensor_path = os.path.join(get_gittop(), tensor_dir)
    print("=========================================================================")
    print(f"{bcolors.HEADER}FWD Pass: Comparing src_txact vs ref_txact computed from nlin_rxact and alpha=0.2{bcolors.ENDC}")

    for i in range(1,7):
        nlin_rxact2 = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.rxact.npy"))
        src_txact = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.txact.npy"))
        ref_txact = np.where(nlin_rxact2 >= 0, nlin_rxact2, nlin_rxact2*0.2) if i <=4 else np.where(nlin_rxact2 >= 0, nlin_rxact2, 0)
        granular_comparison(src_txact, ref_txact, f"tensor_nlin{i}.txact.npy", f"Computed reference txact{i}")

    print("=========================================================================")

def check_bwd_pass():
    tensor_path = os.path.join(get_gittop(), tensor_dir)
    print("=========================================================================")
    print(f"{bcolors.HEADER}BWD Pass: Comparing src_txdelta vs ref_txdelta computed from nlin_rxact and alpha=0.2{bcolors.ENDC}")

    for i in range(1,7):
        nlin_rxact2 = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.rxact.npy"))
        nlin_rxdelta = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.rxdelta.npy"))
        src_txdelta = np.load(os.path.join(tensor_path, f"tensor_nlin{i}.txdelta.npy"))
        ref_txdelta = np.where(nlin_rxact2 > 0 , nlin_rxdelta, nlin_rxdelta*0.2) if i<= 4 else np.where(nlin_rxact2 > 0 , nlin_rxdelta, 0)
        granular_comparison(src_txdelta, ref_txdelta, f"tensor_nlin{i}.txdelta.npy", f"Computed Reference txdelta{i}")

    print("=========================================================================")
    

def comparison(src, ref , src_name, ref_name): 
    # print(f"Shape of {src_name} / {ref_name}: {src.shape}")

    if np.array_equal(src, ref):
        print(f"Match for {src_name} and {ref_name}")
    else:
        print(f"{src_name} and {ref_name} did not match. Max abosulte difference for mismatch sample", np.max(np.abs(src - ref)))
            

def granular_comparison(src, ref , src_name, ref_name): 
    print(f"Comparing {src_name} vs {ref_name}")

    if np.array_equal(src, ref):
        print(f"{bcolors.OKGREEN}Complete Match for {src_name} and {ref_name}{bcolors.ENDC}")
    else:
        for i in range(src.shape[0]):
            if not np.array_equal(src[i], ref[i]):
                print(f"{src_name} and {ref_name} did not match for sample index {i} Max abosulte difference for mismatch sample index {i}", np.max(np.abs(src[i] - ref[i])))
            else:
                print(f"{bcolors.OKGREEN}Match for sample index {i}{bcolors.ENDC}")




class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

if __name__ == "__main__":
    main()
