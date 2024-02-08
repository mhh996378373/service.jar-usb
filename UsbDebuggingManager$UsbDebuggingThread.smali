.class Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;
.super Ljava/lang/Thread;
.source "UsbDebuggingManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbDebuggingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UsbDebuggingThread"
.end annotation


# instance fields
.field private mInputStream:Ljava/io/InputStream;

.field private mOutputStream:Ljava/io/OutputStream;

.field private mSocket:Landroid/net/LocalSocket;

.field private mStopped:Z

.field final synthetic this$0:Lcom/android/server/usb/UsbDebuggingManager;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbDebuggingManager;)V
    .registers 3

    .prologue
    .line 79
    iput-object p1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->this$0:Lcom/android/server/usb/UsbDebuggingManager;

    .line 80
    const-string/jumbo v0, "UsbDebuggingManager"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method private closeSocketLocked()V
    .registers 5

    .prologue
    .line 157
    :try_start_0
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_c

    .line 158
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_c} :catch_19

    .line 166
    :cond_c
    :goto_c
    :try_start_c
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    if-eqz v0, :cond_18

    .line 167
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v0}, Landroid/net/LocalSocket;->close()V

    .line 168
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_18} :catch_35

    .line 173
    :cond_18
    :goto_18
    return-void

    .line 161
    :catch_19
    move-exception v0

    .line 162
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed closing output stream: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 170
    :catch_35
    move-exception v0

    .line 171
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed closing socket: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18
.end method

.method private listenToSocket()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    const/16 v0, 0x1000

    :try_start_2
    new-array v0, v0, [B

    .line 130
    :goto_4
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mInputStream:Ljava/io/InputStream;

    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_5b

    move-result v1

    .line 131
    if-gez v1, :cond_12

    .line 148
    :goto_c
    monitor-enter p0

    .line 149
    :try_start_d
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->closeSocketLocked()V
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_88

    monitor-exit p0

    .line 152
    return-void

    .line 135
    :cond_12
    const/4 v2, 0x0

    :try_start_13
    aget-byte v2, v0, v2

    const/16 v3, 0x50

    if-ne v2, v3, :cond_62

    const/4 v2, 0x1

    aget-byte v2, v0, v2

    const/16 v3, 0x4b

    if-ne v2, v3, :cond_62

    .line 136
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x2

    invoke-static {v0, v3, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

    .line 137
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Received public key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->this$0:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDebuggingManager;->-get2(Lcom/android/server/usb/UsbDebuggingManager;)Landroid/os/Handler;

    move-result-object v1

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 139
    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 140
    iget-object v2, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->this$0:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDebuggingManager;->-get2(Lcom/android/server/usb/UsbDebuggingManager;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_5a
    .catchall {:try_start_13 .. :try_end_5a} :catchall_5b

    goto :goto_4

    .line 147
    :catchall_5b
    move-exception v0

    .line 148
    monitor-enter p0

    .line 149
    :try_start_5d
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->closeSocketLocked()V
    :try_end_60
    .catchall {:try_start_5d .. :try_end_60} :catchall_8b

    monitor-exit p0

    .line 147
    throw v0

    .line 142
    :cond_62
    :try_start_62
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Wrong message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 143
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/String;-><init>([B)V

    .line 142
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_87
    .catchall {:try_start_62 .. :try_end_87} :catchall_5b

    goto :goto_c

    .line 148
    :catchall_88
    move-exception v0

    monitor-exit p0

    throw v0

    :catchall_8b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private openSocketLocked()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    :try_start_0
    new-instance v0, Landroid/net/LocalSocketAddress;

    const-string/jumbo v1, "adbd"

    .line 111
    sget-object v2, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    .line 110
    invoke-direct {v0, v1, v2}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 112
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mInputStream:Ljava/io/InputStream;

    .line 115
    new-instance v1, Landroid/net/LocalSocket;

    invoke-direct {v1}, Landroid/net/LocalSocket;-><init>()V

    iput-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    .line 116
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1, v0}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 118
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v0}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;

    .line 119
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v0}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mInputStream:Ljava/io/InputStream;
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_29} :catch_2a

    .line 124
    return-void

    .line 120
    :catch_2a
    move-exception v0

    .line 121
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->closeSocketLocked()V

    .line 122
    throw v0
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    const-wide/16 v2, 0x3e8

    .line 87
    :goto_2
    monitor-enter p0

    .line 88
    :try_start_3
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mStopped:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_1d

    if-eqz v0, :cond_9

    monitor-exit p0

    .line 90
    return-void

    .line 93
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->openSocketLocked()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_16
    .catchall {:try_start_9 .. :try_end_c} :catchall_1d

    :goto_c
    monitor-exit p0

    .line 100
    :try_start_d
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->listenToSocket()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_10} :catch_11

    goto :goto_2

    .line 101
    :catch_11
    move-exception v0

    .line 103
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_2

    .line 94
    :catch_16
    move-exception v0

    .line 96
    const-wide/16 v0, 0x3e8

    :try_start_19
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d

    goto :goto_c

    .line 87
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method sendResponse(Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 184
    monitor-enter p0

    .line 185
    :try_start_1
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mStopped:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1f

    if-eqz v0, :cond_12

    .line 187
    :try_start_9
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_12} :catch_14
    .catchall {:try_start_9 .. :try_end_12} :catchall_1f

    :cond_12
    :goto_12
    monitor-exit p0

    .line 194
    return-void

    .line 189
    :catch_14
    move-exception v0

    .line 190
    :try_start_15
    const-string/jumbo v1, "UsbDebuggingManager"

    const-string/jumbo v2, "Failed to write response:"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1e
    .catchall {:try_start_15 .. :try_end_1e} :catchall_1f

    goto :goto_12

    .line 184
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method stopListening()V
    .registers 2

    .prologue
    .line 177
    monitor-enter p0

    .line 178
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->mStopped:Z

    .line 179
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;->closeSocketLocked()V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_9

    monitor-exit p0

    .line 181
    return-void

    .line 177
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
