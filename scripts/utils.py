
def read_phone_txt(txt_path, dim = 1):
    phone_list = []
    with open(txt_path,'r') as f:
        for line in f:
            phone = line.rstrip().split()[dim]
            if phone not in phone_list:
                phone_list.append(phone)
    return phone_list

def write_phone_file(phone_list,txt_path, inv = False):
    with open(txt_path,'w') as f:
        if inv :
            for idx, phone in enumerate(phone_list):
                f.write("{} {}\n".format(phone,idx))
        else:
            for idx, phone in enumerate(phone_list):
                f.write("{} {}\n".format(idx,phone))


