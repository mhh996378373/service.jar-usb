.class Lcom/android/server/usb/UsbPortManager$HALCallback;
.super Landroid/hardware/usb/V1_1/IUsbCallback$Stub;
.source "UsbPortManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HALCallback"
.end annotation


# instance fields
.field public portManager:Lcom/android/server/usb/UsbPortManager;

.field public pw:Lcom/android/internal/util/IndentingPrintWriter;


# direct methods
.method constructor <init>(Lcom/android/internal/util/IndentingPrintWriter;Lcom/android/server/usb/UsbPortManager;)V
    .registers 3

    .prologue
    .line 415
    invoke-direct {p0}, Landroid/hardware/usb/V1_1/IUsbCallback$Stub;-><init>()V

    .line 416
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    .line 417
    iput-object p2, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    .line 418
    return-void
.end method


# virtual methods
.method public notifyPortStatusChange(Ljava/util/ArrayList;I)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/usb/V1_0/PortStatus;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 421
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbPortManager;->-get2(Lcom/android/server/usb/UsbPortManager;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 422
    return-void

    .line 425
    :cond_9
    if-eqz p2, :cond_15

    .line 426
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    const-string/jumbo v1, "port status enquiry failed"

    const/4 v2, 0x6

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 427
    return-void

    .line 430
    :cond_15
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 432
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_60

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/hardware/usb/V1_0/PortStatus;

    .line 433
    new-instance v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    iget-object v1, v9, Landroid/hardware/usb/V1_0/PortStatus;->portName:Ljava/lang/String;

    .line 434
    iget v2, v9, Landroid/hardware/usb/V1_0/PortStatus;->supportedModes:I

    iget v3, v9, Landroid/hardware/usb/V1_0/PortStatus;->currentMode:I

    .line 435
    iget-boolean v4, v9, Landroid/hardware/usb/V1_0/PortStatus;->canChangeMode:Z

    iget v5, v9, Landroid/hardware/usb/V1_0/PortStatus;->currentPowerRole:I

    .line 436
    iget-boolean v6, v9, Landroid/hardware/usb/V1_0/PortStatus;->canChangePowerRole:Z

    .line 437
    iget v7, v9, Landroid/hardware/usb/V1_0/PortStatus;->currentDataRole:I

    iget-boolean v8, v9, Landroid/hardware/usb/V1_0/PortStatus;->canChangeDataRole:Z

    .line 433
    invoke-direct/range {v0 .. v8}, Lcom/android/server/usb/UsbPortManager$RawPortInfo;-><init>(Ljava/lang/String;IIZIZIZ)V

    .line 438
    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ClientCallback: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v9, Landroid/hardware/usb/V1_0/PortStatus;->portName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    goto :goto_1e

    .line 442
    :cond_60
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbPortManager;->-get0(Lcom/android/server/usb/UsbPortManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 443
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 444
    const-string/jumbo v2, "port_info"

    invoke-virtual {v1, v2, v10}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 445
    const/4 v2, 0x1

    iput v2, v0, Landroid/os/Message;->what:I

    .line 446
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 447
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbPortManager;->-get0(Lcom/android/server/usb/UsbPortManager;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 448
    return-void
.end method

.method public notifyPortStatusChange_1_1(Ljava/util/ArrayList;I)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/usb/V1_1/PortStatus_1_1;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 453
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbPortManager;->-get2(Lcom/android/server/usb/UsbPortManager;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 454
    return-void

    .line 457
    :cond_9
    if-eqz p2, :cond_15

    .line 458
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    const-string/jumbo v1, "port status enquiry failed"

    const/4 v2, 0x6

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 459
    return-void

    .line 462
    :cond_15
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 464
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6e

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;

    .line 465
    new-instance v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    iget-object v1, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget-object v1, v1, Landroid/hardware/usb/V1_0/PortStatus;->portName:Ljava/lang/String;

    .line 466
    iget v2, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->supportedModes:I

    iget v3, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->currentMode:I

    .line 467
    iget-object v4, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget-boolean v4, v4, Landroid/hardware/usb/V1_0/PortStatus;->canChangeMode:Z

    iget-object v5, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget v5, v5, Landroid/hardware/usb/V1_0/PortStatus;->currentPowerRole:I

    .line 468
    iget-object v6, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget-boolean v6, v6, Landroid/hardware/usb/V1_0/PortStatus;->canChangePowerRole:Z

    .line 469
    iget-object v7, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget v7, v7, Landroid/hardware/usb/V1_0/PortStatus;->currentDataRole:I

    iget-object v8, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget-boolean v8, v8, Landroid/hardware/usb/V1_0/PortStatus;->canChangeDataRole:Z

    .line 465
    invoke-direct/range {v0 .. v8}, Lcom/android/server/usb/UsbPortManager$RawPortInfo;-><init>(Ljava/lang/String;IIZIZIZ)V

    .line 470
    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ClientCallback: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v9, Landroid/hardware/usb/V1_1/PortStatus_1_1;->status:Landroid/hardware/usb/V1_0/PortStatus;

    iget-object v2, v2, Landroid/hardware/usb/V1_0/PortStatus;->portName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    goto :goto_1e

    .line 474
    :cond_6e
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbPortManager;->-get0(Lcom/android/server/usb/UsbPortManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 475
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 476
    const-string/jumbo v2, "port_info"

    invoke-virtual {v1, v2, v10}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 477
    const/4 v2, 0x1

    iput v2, v0, Landroid/os/Message;->what:I

    .line 478
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 479
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->portManager:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbPortManager;->-get0(Lcom/android/server/usb/UsbPortManager;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 480
    return-void
.end method

.method public notifyRoleSwitchStatus(Ljava/lang/String;Landroid/hardware/usb/V1_0/PortRole;I)V
    .registers 7

    .prologue
    .line 483
    if-nez p3, :cond_1d

    .line 484
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " role switch successful"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 488
    :goto_1c
    return-void

    .line 486
    :cond_1d
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$HALCallback;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " role switch failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    goto :goto_1c
.end method
