import utils
import sys
phone_table_path = sys.argv[1]
pdf_table_path = sys.argv[2] 

phones = utils.read_phone_txt(phone_table_path,0)

L = []
for x in phones:
    for s in ['<','#']:
        if x.startswith(s):
            break
    else:
        L.append(x)

utils.write_phone_file(L,pdf_table_path,True)
