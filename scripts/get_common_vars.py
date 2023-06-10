import argparse
from pathlib import Path

def get_cmd_args():
    """
    Get command lines args as dic
    """
    ap = argparse.ArgumentParser(description = "Find variant intersection from 2 pvar files for plink filtering")
    ap.add_argument("--pvar1",
                    help = "A pvar file",
                    type = Path,
                    required = True)
    ap.add_argument("--pvar2",
                    help = "Other pvar file",
                    type = Path,
                    required = True)
    
    outp = vars(ap.parse_args())
    for key in outp:
        outp[key] = outp[key].resolve()
        
    return outp

def read_vars_pvar(pvar_fn):
    """
    Read a pvar file and return list of variant names (3rd column)
    Parameters:
        pvar_fn: str
            Path to pvar file
    Returns:
        set
            set type of variant names
    """
    with open(pvar_fn, "r") as fh:
        var_list = [line.split()[2] for line in fh if not line[0] == "#"]
        
    return set(var_list[1:])

if __name__ == "__main__":
    cmd_args = get_cmd_args()
    
    
    
    sname_a, sname_b = cmd_args["pvar1"].stem, cmd_args["pvar2"].stem
    common_vars = list(read_vars_pvar(cmd_args["pvar1"]) & read_vars_pvar(cmd_args["pvar2"]))
    
    outp_fn = Path(sname_a + "_" + sname_b + "_intersect" + ".txt")
    outp_path = Path(__file__).parent.parent / "resources"
    
    with open(outp_path / outp_fn, "w") as fh:
        fh.write("\n".join(common_vars))