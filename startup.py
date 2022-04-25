import uvicorn
from argparse import ArgumentParser

argspack = ArgumentParser(description='Image-fastapi startup script help',add_help=True)
argspack.add_argument('-p', '--port', type=int, default=3000, help='Select which port to run the server, defaults to 5000')
argspack.add_argument('-r', '--noreload', type=bool, default=False, help='Select to disable autoreload or not, defaults to False')
argspack.add_argument('-n','--noauth', type=bool,default=False,help='Select to disable authentication on the endpoints or not, defaults to False')
args = argspack.parse_args()

if __name__ == '__main__':
    uvicorn.run('app.main:app', proxy_headers=True,forwarded_allow_ips='*',port=args.port ,reload= not args.noreload)