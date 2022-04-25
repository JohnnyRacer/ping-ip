from fastapi import APIRouter, Depends,Request

router = APIRouter()

@router.get("/")
async def index() -> dict[str, str]:
    return {
        "info": "This is the index page of fastapi-nano. "
        "You probably want to go to 'http://<hostname:port>/docs'.",
    }

"""
@router.get("/local_ip")
async def get_local_ip(request:Request) -> dict[str, str]:
    return {
        "info": "This is the index page of fastapi-nano. "
        "You probably want to go to 'http://<hostname:port>/docs'.",
    }
"""


@router.get("/ip")
async def get_ip(request:Request) -> dict[str, str]:
    return {
        "ip": f"Hello! You are connecting from : {request.client.host} "
    } 