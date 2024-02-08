.class Lcom/android/server/usb/UsbMidiDevice$2;
.super Ljava/lang/Thread;
.source "UsbMidiDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/usb/UsbMidiDevice;->openLocked()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbMidiDevice;

.field final synthetic val$outputReceivers:[Landroid/media/midi/MidiReceiver;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbMidiDevice;Ljava/lang/String;[Landroid/media/midi/MidiReceiver;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    iput-object p3, p0, Lcom/android/server/usb/UsbMidiDevice$2;->val$outputReceivers:[Landroid/media/midi/MidiReceiver;

    .line 208
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    const/4 v7, 0x0

    .line 211
    const/16 v0, 0x200

    new-array v1, v0, [B

    .line 215
    :goto_5
    :try_start_5
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 216
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get2(Lcom/android/server/usb/UsbMidiDevice;)Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_4b
    .catch Landroid/system/ErrnoException; {:try_start_5 .. :try_end_10} :catch_86

    .line 217
    :try_start_10
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get1(Lcom/android/server/usb/UsbMidiDevice;)Z
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_83

    move-result v0

    if-nez v0, :cond_23

    :try_start_18
    monitor-exit v8
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_19} :catch_4b
    .catch Landroid/system/ErrnoException; {:try_start_18 .. :try_end_19} :catch_86

    .line 248
    :goto_19
    const-string/jumbo v0, "UsbMidiDevice"

    const-string/jumbo v1, "input thread exit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    return-void

    :cond_23
    move v6, v7

    .line 220
    :goto_24
    :try_start_24
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get3(Lcom/android/server/usb/UsbMidiDevice;)[Landroid/system/StructPollfd;

    move-result-object v0

    array-length v0, v0

    if-ge v6, v0, :cond_3f

    .line 221
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get3(Lcom/android/server/usb/UsbMidiDevice;)[Landroid/system/StructPollfd;

    move-result-object v0

    aget-object v0, v0, v6

    .line 222
    iget-short v2, v0, Landroid/system/StructPollfd;->revents:S

    sget v3, Landroid/system/OsConstants;->POLLERR:I

    .line 223
    sget v9, Landroid/system/OsConstants;->POLLHUP:I
    :try_end_3b
    .catchall {:try_start_24 .. :try_end_3b} :catchall_83

    .line 222
    or-int/2addr v3, v9

    and-int/2addr v2, v3

    if-eqz v2, :cond_56

    :cond_3f
    :try_start_3f
    monitor-exit v8

    .line 241
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get3(Lcom/android/server/usb/UsbMidiDevice;)[Landroid/system/StructPollfd;

    move-result-object v0

    const/4 v2, -0x1

    invoke-static {v0, v2}, Landroid/system/Os;->poll([Landroid/system/StructPollfd;I)I
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_4a} :catch_4b
    .catch Landroid/system/ErrnoException; {:try_start_3f .. :try_end_4a} :catch_86

    goto :goto_5

    .line 243
    :catch_4b
    move-exception v0

    .line 244
    const-string/jumbo v0, "UsbMidiDevice"

    const-string/jumbo v1, "reader thread exiting"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_19

    .line 225
    :cond_56
    :try_start_56
    iget-short v2, v0, Landroid/system/StructPollfd;->revents:S

    sget v3, Landroid/system/OsConstants;->POLLIN:I

    and-int/2addr v2, v3

    if-eqz v2, :cond_7f

    .line 227
    const/4 v2, 0x0

    iput-short v2, v0, Landroid/system/StructPollfd;->revents:S

    .line 229
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get0(Lcom/android/server/usb/UsbMidiDevice;)[Ljava/io/FileInputStream;

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-eq v6, v0, :cond_3f

    .line 234
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get0(Lcom/android/server/usb/UsbMidiDevice;)[Ljava/io/FileInputStream;

    move-result-object v0

    aget-object v0, v0, v6

    invoke-virtual {v0, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 235
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$2;->val$outputReceivers:[Landroid/media/midi/MidiReceiver;

    aget-object v0, v0, v6

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/media/midi/MidiReceiver;->send([BIIJ)V
    :try_end_7f
    .catchall {:try_start_56 .. :try_end_7f} :catchall_83

    .line 220
    :cond_7f
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_24

    .line 216
    :catchall_83
    move-exception v0

    :try_start_84
    monitor-exit v8

    throw v0
    :try_end_86
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_86} :catch_4b
    .catch Landroid/system/ErrnoException; {:try_start_84 .. :try_end_86} :catch_86

    .line 245
    :catch_86
    move-exception v0

    .line 246
    const-string/jumbo v0, "UsbMidiDevice"

    const-string/jumbo v1, "reader thread exiting"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_19
.end method
