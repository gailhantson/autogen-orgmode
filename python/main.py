import asyncio
import websockets

# Simple handler that:
# 1. Receives a message from the client
# 2. Prints or processes it
# 3. Sends a response back
async def handler(websocket, path):
    try:
        async for message in websocket:
            # Here you can call Autogen or do any logic you want
            print(f"Received from client: {message}")

            # Basic echo response
            response = f"Server says: you sent '{message}'"
            await websocket.send(response)
    except websockets.ConnectionClosed:
        print("Client disconnected")

async def main():
    # Serve on port 8000
    async with websockets.serve(handler, "0.0.0.0", 8000):
        print("WebSocket server running on ws://0.0.0.0:8000")
        await asyncio.Future()  # Run forever

if __name__ == "__main__":
    asyncio.run(main())
