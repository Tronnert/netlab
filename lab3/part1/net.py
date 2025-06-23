from math import log2, ceil

def from_bin(ip):
    ip_bin = ""
    ip_norm = ""
    for e in range(4):
        ip_bin += ip[e * 8:(e + 1) * 8] + "."
        ip_norm += str(int(ip[e * 8:(e + 1) * 8], 2)) + "."
    ip_bin = ip_bin[:-1]
    ip_norm = ip_norm[:-1]
    return ip_bin, ip_norm

def get(ip, mask, k):
    n = ceil(log2(k)) + (1 if k in [2, 4, 8, 16] else 0)
    l = mask + n
    maskf = "1" * l + "0" * (8 * 4 - l)
    mask_bin, mask_norm = from_bin(maskf)
    print(mask_norm)
    inv_mask = "".join(list(map(lambda x: str(int(not int(x))), maskf)))
    ip_s = [bin(int(e))[2:] for e in ip.split(".")]
    ip_s = "".join(["0" * (8 - len(e)) + e for e in ip_s])
    print(from_bin(ip_s)[1])
    print()
    for e in range(1, k + 1):
        sub_ip = list(ip_s)
        bin_e = bin(e)[2:]
        bin_e = "0" * (n - len(bin_e)) + bin_e
        if k in [2, 4, 8, 16]:
            bin_e = "1" + bin_e[1:]
        sub_ip[mask:l] = list(bin_e)
        ip_s = "".join(sub_ip)
        sub_ip_bin, sub_ip_norm = from_bin(ip_s)
        
        wide = "".join([str(int(e) or int(j)) for e, j in zip(ip_s, inv_mask)])
        
        wide_norm = from_bin(wide)[1]
        wide_norm = wide_norm[:-1] + "4"
        print(f"{sub_ip_norm}/{mask_bin.count("1")} {wide_norm}")
        # print(wide_norm)
        # print(f"ip addr {wide_norm} {mask_norm}")


get("172.0.0.0", 8, 5)
print()
print("#" * 10)
print()
get("169.254.0.0", 16, 4)
print()
print("#" * 10)
print()
get("62.16.0.0", 12, 2)
