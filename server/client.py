import asyncio
import websockets

async def echo():
    uri = "ws://localhost:5000/websockets/register/dorr"
    async with websockets.connect(uri) as websocket:
        while True:
            messageFromServer = await websocket.recv()
            print(f"got the following from server: {messageFromServer}")

if __name__ == "__main__":
    asyncio.run(echo())